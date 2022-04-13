#![doc = include_str!("../README.md")]
#![forbid(clippy::undocumented_unsafe_blocks)]
#![warn(missing_docs)]
#![allow(clippy::tabs_in_doc_comments)]
{%- if crate_type == "bin" %}

fn main() {
	println!("Hello, world!");
}

{%- endif %}
