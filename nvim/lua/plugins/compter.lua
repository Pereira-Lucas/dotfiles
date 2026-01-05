return {
  'Pereira-Lucas/compter.nvim',
  config = function()
    require('compter').setup {
      templates = {
        -- this template match numbers
        {
          pattern = [[-\?\d\+]],
          priority = 0,
          increase = function(content)
            content = tonumber(content)
            return content + 1, true
          end,
          decrease = function(content)
            content = tonumber(content)
            return content - 1, true
          end,
        },
        -- for boolean
        {
          pattern = [[\<\(true\|false\|TRUE\|FALSE\|True\|False\)\>]],
          priority = 10,
          increase = function(content)
            local switch = {
              ['true'] = 'false',
              ['false'] = 'true',
              ['True'] = 'False',
              ['False'] = 'True',
              ['TRUE'] = 'FALSE',
              ['FALSE'] = 'TRUE',
            }
            return switch[content], true
          end,
          decrease = function(content)
            local switch = {
              ['true'] = 'false',
              ['false'] = 'true',
              ['True'] = 'False',
              ['False'] = 'True',
              ['TRUE'] = 'FALSE',
              ['FALSE'] = 'TRUE',
            }
            return switch[content], true
          end,
        },
        -- vuetify classes
        {
          pattern = [===[[gmp][ablrt]-n\?[0-9]\+]===],
          priority = 100,
          increase = function(content)
            local splited = vim.split(content, '-')
            local class_part = splited[1]
            local counter_part = splited[2]

            local negative = false
            if counter_part:sub(1, 1) == 'n' then
              negative = true
            end

            local nb_int = 0
            local nb = '0'
            if negative then
              nb_int = tonumber(counter_part:sub(2))
              nb_int = nb_int - 1

              if nb_int >= 1 then
                nb = 'n' .. tostring(nb_int)
              else
                nb = tostring(nb_int)
              end
            else
              nb_int = tonumber(counter_part)
              nb_int = nb_int + 1
              nb = tostring(nb_int)
            end

            return class_part .. '-' .. nb, true
          end,
          decrease = function(content)
            local splited = vim.split(content, '-')
            local class_part = splited[1]
            local counter_part = splited[2]

            local negative = false
            if counter_part:sub(1, 1) == 'n' then
              negative = true
            end

            local nb_int = 0
            local nb = '0'
            if negative then
              nb_int = tonumber(counter_part:sub(2))
              nb_int = nb_int + 1
              nb = 'n' .. tostring(nb_int)
            else
              nb_int = tonumber(counter_part)
              nb_int = nb_int - 1

              if nb_int < 0 then
                nb = 'n' .. tostring(math.abs(nb_int))
              else
                nb = tostring(nb_int)
              end
            end

            return class_part .. '-' .. nb, true
          end,
        },
      },
    }
  end,
}
