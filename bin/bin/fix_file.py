#! /usr/bin/env -S uv run --script
import fileinput


def replace_html_entities_in_file(filename):
    """
    Replaces common HTML entities (&lt;, &gt;, &amp;) with their
    corresponding characters (<, >, &) directly within the given file.

    Args:
        filename (str): The path to the file to modify.
    """
    for line in fileinput.input(filename, inplace=True):
        # fileinput.input with inplace=True redirects stdout to the file
        modified_line = line.replace('&lt;', '<').replace('&gt;', '>').replace('&amp;', '&')
        print(modified_line, end='')  # end='' prevents adding extra newlines


if __name__ == "__main__":
    file_to_modify = input("Enter the path to the file you want to modify: ")
    try:
        replace_html_entities_in_file(file_to_modify)
        print(f"Successfully replaced HTML entities in {file_to_modify}")
    except FileNotFoundError:
        print(f"Error: File not found at {file_to_modify}")
    except Exception as e:
        print(f"An error occurred: {e}")
