#![doc = include_str!("../README.md")]
#![deny(clippy::undocumented_unsafe_blocks)]
{%- if crate_type == "lib" %}
#![warn(missing_docs)]
{%- endif %}
#![allow(clippy::tabs_in_doc_comments)]
{%- if crate_type == "bin" %}

fn main() {}

{%- endif %}
