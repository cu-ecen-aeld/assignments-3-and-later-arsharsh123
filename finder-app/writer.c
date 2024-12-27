#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid arguments. Usage: %s <file> <string>", argv[0]);
        fprintf(stderr, "Usage: %s <file> <string>\n", argv[0]);
        return 1;
    }

    const char *filename = argv[1];
    const char *string = argv[2];

    FILE *file = fopen(filename, "w");
    if (!file) {
        syslog(LOG_ERR, "Failed to open file: %s", filename);
        perror("fopen");
        return 1;
    }

    fprintf(file, "%s", string);
    fclose(file);

    syslog(LOG_DEBUG, "Writing '%s' to '%s'", string, filename);
    return 0;
}
