local status, kommentary = pcall(require, 'kommentary.config')
if (not status) then return end

local langs = { 'typescriptreact', 'vue' }
for _, lang in pairs(langs) do
  kommentary.configure_language(lang, {
    single_line_comment_string = 'auto',
    multi_line_comment_strings = 'auto',
    hook_function = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end,
  })
end
