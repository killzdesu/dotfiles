local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end
local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mapping
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'vimls', 'sumneko_lua' }
for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end



-------- Volar --------

-- nvim_lsp.volar.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   -- Overload mode to cover JS & typescript in Volar only
--   init_options = {
--     typescript = {
--       serverPath = 'C:/Users/Jui/AppData/Roaming/npm/node_modules/typescript/lib/tsserverlibrary.js'
--     }
--   },
--   filetypes = {
--     'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'
--   }
-- }

local lspconfig = require'lspconfig'
local lspconfig_configs = require'lspconfig.configs'
local lspconfig_util = require 'lspconfig.util'

local function on_new_config(new_config, new_root_dir)
  local function get_typescript_server_path(root_dir)
    local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
    return project_root and (lspconfig_util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js'))
      or ''
  end

  if
    new_config.init_options
    and new_config.init_options.typescript
    and new_config.init_options.typescript.serverPath == ''
  then
    new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
  end
end

local volar_cmd = {'cmd.exe', '/C', 'volar-server', '--stdio'}
local volar_root_dir = lspconfig_util.root_pattern 'package.json'

lspconfig_configs.volar_api = {
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,
    on_attach = on_attach,
    capabilities = capabilities,
    -- filetypes = { 'vue'},
    -- If you want to use Volar's Take Over Mode (if you know, you know)
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = ''
      },
      languageFeatures = {
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
        rename = true,
        renameFileRefactoring = true,
        signatureHelp = true,
        codeAction = true,
        workspaceSymbol = true,
        completion = {
          defaultTagNameCase = 'both',
          defaultAttrNameCase = 'kebabCase',
          getDocumentNameCasesRequest = false,
          getDocumentSelectionRequest = false,
        },
      }
    },
  }
}
lspconfig.volar_api.setup{}

lspconfig_configs.volar_doc = {
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    -- filetypes = { 'vue'},
    -- If you want to use Volar's Take Over Mode (if you know, you know):
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
    init_options = {
      typescript = {
        serverPath = ''
      },
      languageFeatures = {
        documentHighlight = true,
        documentLink = true,
        codeLens = { showReferencesNotification = true},
        -- not supported - https://github.com/neovim/neovim/pull/14122
        semanticTokens = false,
        diagnostics = true,
        schemaRequestService = true,
      }
    },
  }
}
lspconfig.volar_doc.setup{}

lspconfig_configs.volar_html = {
  default_config = {
    cmd = volar_cmd,
    root_dir = volar_root_dir,
    on_new_config = on_new_config,

    -- filetypes = { 'vue'},
    -- If you want to use Volar's Take Over Mode (if you know, you know), intentionally no 'json':
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
      typescript = {
        serverPath = ''
      },
      documentFeatures = {
        selectionRange = true,
        foldingRange = true,
        linkedEditingRange = true,
        documentSymbol = true,
        -- not supported - https://github.com/neovim/neovim/pull/13654
        documentColor = false,
        documentFormatting = {
          defaultPrintWidth = 100,
        },
      }
    },
  }
}
lspconfig.volar_html.setup{}

