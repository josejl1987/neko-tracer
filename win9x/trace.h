
#ifdef __cplusplus
extern "C" {
#endif

void trace_init(void);
void trace_term(void);
void trace_fmt(const char *str, ...);
void trace_fmt2(const char *str, ...);
void trace_char(char c);
void trace_fileout(const OEMCHAR *fname);

#ifndef TRACE

#define	TRACEINIT()
#define	TRACETERM()
#define	TRACEOUT(a)
#define	VERBOSE(a)
#define	APPDEVOUT(a)

#else

#define	TRACEINIT()		trace_init()
#define	TRACETERM()		trace_term()
#define	TRACEOUT(arg)	trace_fmt arg
#define	VERBOSE(arg)	trace_fmt2 arg
#define	APPDEVOUT(arg)	trace_char(arg)

#endif

#ifdef __cplusplus
}
#endif

