return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "codex",
    auto_suggestions_provider = "b3gpt",
    providers = {
      b3gpt = {
        __inherited_from = "openai",

        -- endpoint template com {model}
        endpoint = "https://api-b3gpt.b3.com.br/internal-api/b3gpt-llms/v1/openai/deployments/{model}/chat/completions",

        -- deployment/model default
        model = "gpt-5.4-mini",

        -- variável de ambiente com o token
        api_key_name = "B3GPT_API_KEY",

        timeout = 30000,

        -- body extra opcional
        extra_request_body = {
          temperature = 0,
        },

        parse_curl_args = function(opts, code_opts)
          local api_key = os.getenv(opts.api_key_name)
          if not api_key or api_key == "" then
            error("Avante B3GPT: variável de ambiente " .. opts.api_key_name .. " não definida")
          end

          local model = opts.model
          if not model or model == "" then
            error("Avante B3GPT: model não definido")
          end

          local endpoint = opts.endpoint:gsub("{model}", model)

          local messages = (code_opts and code_opts.messages) or opts.messages
          if not messages then
            error("Avante B3GPT: messages não encontrado em code_opts.messages nem opts.messages")
          end

          local body = vim.tbl_deep_extend("force", {
            -- se sua API não exigir model no body, pode remover esta linha
            messages = messages,
            stream = true,
          }, opts.extra_request_body or {})

          return {
            url = endpoint,
            headers = {
              ["Content-Type"] = "application/json",
              ["api-key"] = api_key,
            },
            body = {
              model = model,
              messages = messages,
              stream = false, -- importante para testar
            },
          }
        end,
      },
    },
    acp_providers = {
      ["codex"] = {
        command = "codex-acp",
        args = {},
        env = {
          NODE_NO_WARNINGS = "1",
          -- OPENAI_API_KEY = os.getenv("OPENAI_API_KEY"),
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
