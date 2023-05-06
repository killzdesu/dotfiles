local installer_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not installer_ok then
	return
end
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "lua_ls", "volar", "tailwindcss" }

mason.setup {
  ui = {
    icons = {
      package_installed = "✓"
    }
  }
}
lsp_installer.setup({
	ensure_installed = servers,
})

local installed_servers = require("mason-registry").get_installed_package_names()
local server_mapping = lsp_installer.get_mappings().mason_to_lspconfig
--[[ for _, s in pairs(installed_servers) do ]]
--[[   print(server_mapping[s]) ]]
--[[ end ]]

--[[ ## use ensure_installed for server configuration ]]
--[[ for _, server in pairs(servers) do ]]
--[[ ## use installed server for server configuration ]]
for _, server_package in pairs(installed_servers) do
  local server = server_mapping[ server_package ]
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
