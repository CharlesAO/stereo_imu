#ifndef TRACE_H
#define TRACE_H
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#define ATRACE_MESSAGE_LEN 256


class Tracer {

public:

	static void trace_init();


	static inline void trace_begin(const char *name)
	{
	    char buf[ATRACE_MESSAGE_LEN];
	    int len = snprintf(buf, ATRACE_MESSAGE_LEN, "B|%d|%s", getpid(), name);
	    write(atrace_marker_fd, buf, len);
	}

	static inline void trace_end()
	{
	    char c = 'E';
	    write(atrace_marker_fd, &c, 1);
	}

	static int atrace_marker_fd;
};

#endif
