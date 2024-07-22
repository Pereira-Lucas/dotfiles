local custom_prompts = {
  Generate_Doc = {
    prompt = 'Generate the JSDoc documentation for the following function. Only output the result in format ```$filetype\n...\n```:```$filetype\n$text\n```',
  },
}

return {
  'David-Kunz/gen.nvim',
  opts = {
    model = 'Nebulone',
    -- model = 'nebulone:q8_0',
    -- model = 'nebulone:q4_K_S',
    display_mode = 'split',
    show_prompt = true,
    show_model = true,
  },
  init = function()
    pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
  end,
  config = function(_, opts)
    local gen = require 'gen'
    for key, value in pairs(custom_prompts) do
      gen.prompts[key] = value
    end

    gen.setup(opts)
  end,
  keys = {
    { '<leader>ol', ':Gen<cr>', mode = 'n', desc = '[O]llama [L]ist' },
    { '<leader>ol', ":'<,'>Gen<cr>", mode = 'v', desc = '[O]llama [L]ist' },

    { '<leader>oa', ":'<,'>Gen Ask<cr>", mode = 'v', desc = '[O]llama [A]sk' },

    { '<leader>oc', ':Gen Chat<cr>', mode = 'n', desc = '[O]llama [C]hat' },

    { '<leader>os', ":'<,'>Gen Summarize<cr>", mode = 'v', desc = '[O]llama [S]ummarize' },
    { '<leader>oe', ":'<,'>Gen Enhance_Code<cr>", mode = 'v', desc = '[O]llama [E]nhance' },
    { '<leader>or', ":'<,'>Gen Review_Code<cr>", mode = 'v', desc = '[O]llama [R]eview' },
    { '<leader>od', ":'<,'>Gen Generate_Doc<cr>", mode = 'v', desc = '[O]llama [D]ocument' },
  },
}
