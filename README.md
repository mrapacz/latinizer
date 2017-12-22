# Latinizer
[![CircleCI](https://img.shields.io/circleci/project/github/mrapacz/latinizer.svg)](https://circleci.com/gh/mrapacz/latinizer/tree/master)
[![Hex.pm](https://img.shields.io/hexpm/v/latinizer.svg)](https://hex.pm/packages/latinizer/)
[![Test Coverage](https://img.shields.io/coveralls/github/mrapacz/latinizer/master.svg)](https://github.com/mrapacz/latinizer)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/mrapacz/latinizer/blob/enhancement/readme-badges/LICENSE)
**A string-translating module responsible for getting rid of diacritical signs in strings**

## Installation

Available in [Hex](https://hex.pm/packages/latinizer/).

The package can be installed by adding `latinizer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:latinizer, "~> 0.4.0"}]
end
```

## Usage

The lib allows one to transcribe and remove diacritics from strings containing characters used in most of the European languages (e.g. Polish, Russian, Swedish, French etc.) to string containing only latin letters. The most common usage is as follows:


```elixir
iex> Latinizer.latinize "Pchnij w tę łódź jeża lub ośm skrzyń fig."
"Pchnij w te lodz jeza lub osm skrzyn fig."

iex>  Latinizer.latinize "Pchnij w tę łódź jeża lub ośm skrzyń fig.", only: ["ż", "ę"]    
"Pchnij w te łódź jeza lub ośm skrzyń fig."

iex> Latinizer.latinize "В начале было Слово, и Слово было у Бога, и Слово было Бог."
"V nachale bylo Slovo, i Slovo bylo u Boga, i Slovo bylo Bog."
```

To find more examples and functions provided by the library, read [the docs](https://hexdocs.pm/latinizer).

## Contributing

Should you find missing character mappings or any other problems, feel free to create
issues in the repo for that, I'll be happy to help.
