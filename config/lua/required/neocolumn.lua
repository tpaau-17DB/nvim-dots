-- configure neocolumn

local config = {
  fg_color = "",
  bg_color = "",
  NeoColumn = "80",
  always_on = true,
  custom_NeoColumn = {},
  excluded_ft = {},
}

require("NeoColumn").setup(config)
