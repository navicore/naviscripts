local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("lua", {
    s("mySecondSnippet",
    fmt(
[[
local {} = function({})
    {} {{ I am in curly braces }}
end

]],
        {
            i(1, "myVar"),
            c(2, { t(""), t("myArg") }),
            i(3, "-- TODO: something"),
        }
    )
    )
})

ls.add_snippets("rust", {
  s({ trig = 'struct', dscr = 'Classic `struct` that implements `std::fmt::Debug`' }, {
    t { '#[derive(Eq, PartialEq, Clone, Debug)]', '' },
    t { 'struct ' },
    i(1, 'Name'),
    t { ' {', '\t' },
    i(0),
    t { '', '' },
    t { '}', '' },
  }),
})

ls.add_snippets("rust", {
    s("ejs-custom-error",
        fmt([[
use derive_more::From;

pub type Result<T> = core::result::Result<T, {}>;

#[derive(Debug, From)]
pub enum {} {{
    #[from]
    Custom(String),

    // add a `from` for every error as you work and remove
    // `Custom` when fully implemented.
}}

impl From<&str> for {} {{
    fn from(val: &str) -> Self {{
        Self::Custom(val.to_string())
    }}
}}

]],
        {
            i(1, "MyError"),
            i(2, "MyError"),
            i(3, "MyError"),
        }
        )
    )
})
