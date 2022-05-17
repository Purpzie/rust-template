fn get(name) { variable::get(name) }
fn set(name, val) { variable::set(name, val) }
fn prompt(prompt_str) { variable::prompt(prompt_str) }
fn prompt(prompt_str, default_val) { variable::prompt(prompt_str, default_val) }
fn prompt(prompt_str, default_val, choices) { variable::prompt(prompt_str, default_val, choices) }

// passing --lib is annoying
if get("crate_type") != "lib" {
	set("crate_type", prompt("Project type", "bin", ["bin", "lib"]));
}
if get("crate_type") == "lib" {
	file::rename("src/main.rs", "src/lib.rs");
}

set("description", prompt("Description", ""));
set("repository", prompt("Repository URL", ""));

set("license", prompt("License", "MIT", [
	"MIT",
	"Unlicense",
	"None",
]));
if get("license") != "None" {
	file::rename(`licenses/${get("license")}`, "LICENSE");
}
file::delete("licenses");

set("github-actions", prompt("Use github actions?", false));
if get("github-actions") {
	let clippy = prompt("    Run clippy", false);
	let test = prompt("    Run tests", false);
	let fmt = prompt("    Run rustfmt", false);
	let docs = prompt("    Check docs", false);
	if clippy || test || fmt || docs {
		for arr in [["clippy", clippy], ["test", test], ["fmt", fmt], ["docs", docs]] {
			set(`action-${arr[0]}`, arr[1]);
		}
	} else {
		set("github-actions", false);
	}
}

if !get("github-actions") {
	file::delete(".github/workflows");
}
