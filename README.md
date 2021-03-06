![hjsonschema logo](./logo.jpg)

A Haskell implementation of the current [JSON Schema](http://json-schema.org/) specification (Draft 4).

[Hackage](https://hackage.haskell.org/package/hjsonschema) / [GitHub](https://github.com/seagreen/hjsonschema) / [Travis CI](https://travis-ci.org/seagreen/hjsonschema)

Requires [pcre](http://www.pcre.org/) (`pkgs.pcre` in Nixpkgs).

NOTE: Schemas with circular references can cause infinite loops. hjsonschema does loop detection but it may not be solid yet -- please open an issue if you find a situation where it fails.

# Example

See [here](https://github.com/seagreen/hjsonschema/blob/master/examples/Simple.hs).

# Tests

Run all tests:

`stack test`

Run only local tests:

`stack test hjsonschema:local`

Run remote tests (makes GETs to json-schema.org, also temporarily starts an HTTP server on port 1234):

`stack test hjsonschema:remote`

# Details

## Goals

+ Be a correct and fast implementation of the spec.

+ Be a useful reference for implementers in other languages. Haskell's high level nature, expressive type system and referential transparency suit this purpose well.

## Good Parts

+ Passes all the required tests in the [language agnostic test suite](https://github.com/json-schema/JSON-Schema-Test-Suite).

+ Very modular, which should make it easy to support future versions of the specification.

## Bad Parts

+ Uses the [pcre-heavy](https://hackage.haskell.org/package/pcre-heavy) regular expression library for the "pattern" validator. It should use a library based on the ECMA 262 regex dialect, which the [spec](http://json-schema.org/latest/json-schema-validation.html#anchor33) requires.

+ Currently doesn't support the optional `"format"` validators.

## Notes

+ `JSON-Schema-Test-Suite` is vendored from commit # aabcb3427745ade7a0b4d49ff016ad7eda8b898b [here](https://github.com/json-schema-org/JSON-Schema-Test-Suite).

+ `src/draft4.json` is from commit # f3d5aeb5ffbe9d9a5a0ceb761dc47c7c4c2efa68 [here](https://github.com/json-schema/json-schema).

## Credits

[TJ Weigel](http://tjweigel.com/) created the logo.

[Tim Baumann](https://github.com/timjb) wrote [aeson-schema](https://hackage.haskell.org/package/aeson-schema), on which hjsonschema's test code and its implementation of `SchemaGraph` were based.

[Julian Berman](https://github.com/Julian) maintains the fantastic [language agnostic test suite](https://github.com/json-schema/JSON-Schema-Test-Suite).
