# Bash Script ShellOperations README

## Directory Operations Script

This Bash script allows users to perform various operations on a specified directory based on their input. The script supports three main operations: analytics (ana), delete (del), and arrange (arr).

### Usage

```bash
./operations.sh DIRECTORY OPERATION_TYPE OPERATION_ARGUMENT
```

### Operations

#### Analytics (ana)

- Searches for a specified pattern in all files within the directory.
- If `OPERATION_ARGUMENT` is not provided, the script prompts the user to enter a search pattern.
- Outputs the total number of occurrences of the pattern in all files.
- Example
```bash
./operations.sh DIRECTORY ana SEARCH_PATTERN
./operations.sh mydir ana osama
```

#### Delete (del)

- Deletes files larger than the specified size (in Bytes) within the directory.
- User prompted to enter a numeric value representing the maximum file size.
- Deletes all files exceeding the specified size.
- Example
```bash
./operations.sh DIRECTORY del MAX_FILE_SIZE_IN_BYTES
./operations.sh mydir del 10
```

#### Arrange (arr)

- Moves files of a specific type (determined by the extension) to a new subdirectory.
- User prompted to enter the type of file (only alphabetical characters allowed) to arrange.
- Creates a new subdirectory and moves all matching files into it.
- Example
```bash
./operations.sh DIRECTORY arr EXTENTION_TYPE
./operations.sh mydir arr txt
```

### Input Validation

- For analytics (ana), ensure a search pattern is provided.
- For delete (del), ensure a numeric value is provided as the maximum file size.
- For arrange (arr), ensure an alphabetical file type is provided.

