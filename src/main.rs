#![doc = include_str!("../README.md")]
#![forbid(unsafe_code, rustdoc::broken_intra_doc_links)]
#![warn(missing_docs)]
#![allow(clippy::tabs_in_doc_comments)]
{%- if crate_type == "bin" %}

fn main() {
	println!("Hello, world!");
}

{%- endif %}
