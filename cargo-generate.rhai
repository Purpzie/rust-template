fn get(name) { variable::get(name) }
fn set(name, val) { variable::set(name, val) }
fn prompt(prompt_str) { variable::prompt(prompt_str) }
fn prompt(prompt_str, default_val) { variable::prompt(prompt_str, default_val) }
fn prompt(prompt_str, default_val, choices) { variable::prompt(prompt_str, default_val, choices) }

set("description", prompt("Description", ""));
set("license", prompt("License", "MIT", ["MIT", "Unlicense", "None"]));
set("repository", prompt("Repository URL", ""));
set("github-actions", prompt("Use github actions?", false));

if get("license") == "None" {
	file::delete("LICENSE");
}

if get("github-actions") {
	let check = prompt("    Run clippy/fmt", false);
	let test = prompt("    Run tests", false);
	let docs = prompt("    Check docs", false);
	if check || test || docs {
		for arr in [["check", check], ["test", test], ["docs", docs]] {
			set(`action-${arr[0]}`, arr[1]);
		}
	} else {
		set("github-actions", false);
	}
}

if !get("github-actions") {
	file::delete(".github/workflows");
}
