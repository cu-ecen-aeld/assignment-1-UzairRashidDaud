#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    openlog("assignment2", LOG_PID, LOG_USER);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Error: Two arguments required.\n");
        syslog(LOG_ERR, "Usage: %s <writefile> <writestr>\n", argv[0]);
    }

    char *writefile = argv[1];
    char *writestr = argv[2];

    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not create or write to file %s\n", writefile);
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    if (fprintf(file, "%s\n", writestr) < 0) {
        syslog(LOG_ERR, "Error: Failed to write to file %s\n", writefile);
        fclose(file);
        return 1;
    }

    fclose(file);
    return 0;
}