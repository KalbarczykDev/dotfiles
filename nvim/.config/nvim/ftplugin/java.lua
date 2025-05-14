local home = os.getenv "HOME"
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local os_name = vim.loop.os_uname().sysname
local config_os

if os_name == "Darwin" then
  config_os = "mac"
elseif os_name == "Linux" then
  config_os = "linux"
elseif os_name == "Windows_NT" then
  config_os = "windows"
else
  print("Unknown OS: " .. os_name)
end

local on_attach = function(client, bufnr)
  if vim.lsp.inlay_hint and type(vim.lsp.inlay_hint.enable) == "function" then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
  if client.server_capabilities.codeLensProvider then
    vim.lsp.codelens.refresh()
  end

  client.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "none",
    silent = true,
    focusable = false,
  })
end
local config = {

  on_attach = on_attach,

  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. config_os,
    "-data",
    workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },

  settings = {
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = extendedClientCapabilities,
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = true,
      },
    },
  },

  init_options = {
    bundles = {
      vim.fn.glob(
        home
        .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
      ),
      vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar"),
    },
  },
}
require("jdtls").start_or_attach(config)

jdtls.setup_dap { hotcodereplace = "auto" }

if jdtls.setup_dap_main_class_configs then
  jdtls.setup_dap_main_class_configs()
end
