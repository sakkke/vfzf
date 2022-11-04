module vfzf

import io.util { temp_file }
import os

// Constants
const fzf_url = 'https://github.com/junegunn/fzf'

[params]
pub struct FzfPromptConfig {
	executable_path string = 'fzf'
}

pub struct FzfPrompt {
	executable_path string
}

[params]
pub struct FzfPromptPromptConfig {
	choices []string
	fzf_options string
	delimiter string = '\n'
}

pub fn new_fzf_prompt(c FzfPromptConfig) &FzfPrompt {
	if c.executable_path == 'fzf' && !os.exists_in_system_path('fzf') {
		panic('Cannot find fzf installed on PATH. $fzf_url')
	}

	return &FzfPrompt{
		executable_path: c.executable_path
	}
}

pub fn (f FzfPrompt) prompt(c FzfPromptPromptConfig) []string {
	// Convert array to string [1, 2, 3] => '1\n2\n3'
	choices_str := c.choices.join(c.delimiter)

	// Create temp files
	_, input_file := temp_file() or { panic(err) }
	_, output_file := temp_file() or { panic(err) }

	// Write list entries to a temp file
	os.write_file(input_file, choices_str) or { panic(err) }

	// Invoke fzf externally and write to output file
	os.system('$f.executable_path $c.fzf_options < "$input_file" > "$output_file"')

	// Get selected options
	selection := os.read_lines(output_file) or { panic(err) }

	os.rm(input_file) or { panic(err) }
	os.rm(output_file) or { panic(err) }

	return selection
}
