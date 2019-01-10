# Generated by detect.nim


# <aio.h>
const AIO_ALLDONE* = cint(2)
const AIO_CANCELED* = cint(0)
const AIO_NOTCANCELED* = cint(1)
const LIO_NOP* = cint(2)
const LIO_NOWAIT* = cint(1)
const LIO_READ* = cint(0)
const LIO_WAIT* = cint(0)
const LIO_WRITE* = cint(1)

# <dlfcn.h>
const RTLD_LAZY* = cint(1)
const RTLD_NOW* = cint(2)
const RTLD_GLOBAL* = cint(256)
const RTLD_LOCAL* = cint(0)

# <errno.h>
const E2BIG* = cint(7)
const EACCES* = cint(13)
const EADDRINUSE* = cint(98)
const EADDRNOTAVAIL* = cint(99)
const EAFNOSUPPORT* = cint(97)
const EAGAIN* = cint(11)
const EALREADY* = cint(114)
const EBADF* = cint(9)
const EBADMSG* = cint(74)
const EBUSY* = cint(16)
const ECANCELED* = cint(125)
const ECHILD* = cint(10)
const ECONNABORTED* = cint(103)
const ECONNREFUSED* = cint(111)
const ECONNRESET* = cint(104)
const EDEADLK* = cint(35)
const EDESTADDRREQ* = cint(89)
const EDOM* = cint(33)
const EDQUOT* = cint(122)
const EEXIST* = cint(17)
const EFAULT* = cint(14)
const EFBIG* = cint(27)
const EHOSTUNREACH* = cint(113)
const EIDRM* = cint(43)
const EILSEQ* = cint(84)
const EINPROGRESS* = cint(115)
const EINTR* = cint(4)
const EINVAL* = cint(22)
const EIO* = cint(5)
const EISCONN* = cint(106)
const EISDIR* = cint(21)
const ELOOP* = cint(40)
const EMFILE* = cint(24)
const EMLINK* = cint(31)
const EMSGSIZE* = cint(90)
const EMULTIHOP* = cint(72)
const ENAMETOOLONG* = cint(36)
const ENETDOWN* = cint(100)
const ENETRESET* = cint(102)
const ENETUNREACH* = cint(101)
const ENFILE* = cint(23)
const ENOBUFS* = cint(105)
const ENODATA* = cint(61)
const ENODEV* = cint(19)
const ENOENT* = cint(2)
const ENOEXEC* = cint(8)
const ENOLCK* = cint(37)
const ENOLINK* = cint(67)
const ENOMEM* = cint(12)
const ENOMSG* = cint(42)
const ENOPROTOOPT* = cint(92)
const ENOSPC* = cint(28)
const ENOSR* = cint(63)
const ENOSTR* = cint(60)
const ENOSYS* = cint(38)
const ENOTCONN* = cint(107)
const ENOTDIR* = cint(20)
const ENOTEMPTY* = cint(39)
const ENOTSOCK* = cint(88)
const ENOTSUP* = cint(95)
const ENOTTY* = cint(25)
const ENXIO* = cint(6)
const EOPNOTSUPP* = cint(95)
const EOVERFLOW* = cint(75)
const EPERM* = cint(1)
const EPIPE* = cint(32)
const EPROTO* = cint(71)
const EPROTONOSUPPORT* = cint(93)
const EPROTOTYPE* = cint(91)
const ERANGE* = cint(34)
const EROFS* = cint(30)
const ESPIPE* = cint(29)
const ESRCH* = cint(3)
const ESTALE* = cint(116)
const ETIME* = cint(62)
const ETIMEDOUT* = cint(110)
const ETXTBSY* = cint(26)
const EWOULDBLOCK* = cint(11)
const EXDEV* = cint(18)

# <fcntl.h>
const F_DUPFD* = cint(0)
const F_GETFD* = cint(1)
const F_SETFD* = cint(2)
const F_GETFL* = cint(3)
const F_SETFL* = cint(4)
const F_GETLK* = cint(5)
const F_SETLK* = cint(6)
const F_SETLKW* = cint(7)
const F_GETOWN* = cint(9)
const F_SETOWN* = cint(8)
const FD_CLOEXEC* = cint(1)
const F_RDLCK* = cint(0)
const F_UNLCK* = cint(2)
const F_WRLCK* = cint(1)
const O_CREAT* = cint(64)
const O_EXCL* = cint(128)
const O_NOCTTY* = cint(256)
const O_TRUNC* = cint(512)
const O_APPEND* = cint(1024)
const O_DSYNC* = cint(4096)
const O_NONBLOCK* = cint(2048)
const O_RSYNC* = cint(1052672)
const O_SYNC* = cint(1052672)
const O_ACCMODE* = cint(3)
const O_RDONLY* = cint(0)
const O_RDWR* = cint(2)
const O_WRONLY* = cint(1)
const POSIX_FADV_NORMAL* = cint(0)
const POSIX_FADV_SEQUENTIAL* = cint(2)
const POSIX_FADV_RANDOM* = cint(1)
const POSIX_FADV_WILLNEED* = cint(3)
const POSIX_FADV_DONTNEED* = cint(4)
const POSIX_FADV_NOREUSE* = cint(5)

# <fenv.h>
const FE_DIVBYZERO* = cint(4)
const FE_INEXACT* = cint(32)
const FE_INVALID* = cint(1)
const FE_OVERFLOW* = cint(8)
const FE_UNDERFLOW* = cint(16)
const FE_ALL_EXCEPT* = cint(61)
const FE_DOWNWARD* = cint(1024)
const FE_TONEAREST* = cint(0)
const FE_TOWARDZERO* = cint(3072)
const FE_UPWARD* = cint(2048)
const FE_DFL_ENV* = cint(-1)

# <fmtmsg.h>
const MM_HARD* = cint(1)
const MM_SOFT* = cint(2)
const MM_FIRM* = cint(4)
const MM_APPL* = cint(8)
const MM_UTIL* = cint(16)
const MM_OPSYS* = cint(32)
const MM_RECOVER* = cint(64)
const MM_NRECOV* = cint(128)
const MM_HALT* = cint(1)
const MM_ERROR* = cint(2)
const MM_WARNING* = cint(3)
const MM_INFO* = cint(4)
const MM_NOSEV* = cint(0)
const MM_PRINT* = cint(256)
const MM_CONSOLE* = cint(512)
const MM_OK* = cint(0)
const MM_NOTOK* = cint(-1)
const MM_NOMSG* = cint(1)
const MM_NOCON* = cint(4)

# <fnmatch.h>
const FNM_NOMATCH* = cint(1)
const FNM_PATHNAME* = cint(1)
const FNM_PERIOD* = cint(4)
const FNM_NOESCAPE* = cint(2)

# <ftw.h>
const FTW_F* = cint(0)
const FTW_D* = cint(1)
const FTW_DNR* = cint(2)
const FTW_NS* = cint(3)
const FTW_SL* = cint(4)

# <glob.h>
const GLOB_APPEND* = cint(32)
const GLOB_DOOFFS* = cint(8)
const GLOB_ERR* = cint(1)
const GLOB_MARK* = cint(2)
const GLOB_NOCHECK* = cint(16)
const GLOB_NOESCAPE* = cint(64)
const GLOB_NOSORT* = cint(4)
const GLOB_ABORTED* = cint(2)
const GLOB_NOMATCH* = cint(3)
const GLOB_NOSPACE* = cint(1)
const GLOB_NOSYS* = cint(4)

# <langinfo.h>
const CODESET* = cint(14)
const D_T_FMT* = cint(131112)
const D_FMT* = cint(131113)
const T_FMT* = cint(131114)
const T_FMT_AMPM* = cint(131115)
const AM_STR* = cint(131110)
const PM_STR* = cint(131111)
const DAY_1* = cint(131079)
const DAY_2* = cint(131080)
const DAY_3* = cint(131081)
const DAY_4* = cint(131082)
const DAY_5* = cint(131083)
const DAY_6* = cint(131084)
const DAY_7* = cint(131085)
const ABDAY_1* = cint(131072)
const ABDAY_2* = cint(131073)
const ABDAY_3* = cint(131074)
const ABDAY_4* = cint(131075)
const ABDAY_5* = cint(131076)
const ABDAY_6* = cint(131077)
const ABDAY_7* = cint(131078)
const MON_1* = cint(131098)
const MON_2* = cint(131099)
const MON_3* = cint(131100)
const MON_4* = cint(131101)
const MON_5* = cint(131102)
const MON_6* = cint(131103)
const MON_7* = cint(131104)
const MON_8* = cint(131105)
const MON_9* = cint(131106)
const MON_10* = cint(131107)
const MON_11* = cint(131108)
const MON_12* = cint(131109)
const ABMON_1* = cint(131086)
const ABMON_2* = cint(131087)
const ABMON_3* = cint(131088)
const ABMON_4* = cint(131089)
const ABMON_5* = cint(131090)
const ABMON_6* = cint(131091)
const ABMON_7* = cint(131092)
const ABMON_8* = cint(131093)
const ABMON_9* = cint(131094)
const ABMON_10* = cint(131095)
const ABMON_11* = cint(131096)
const ABMON_12* = cint(131097)
const ERA* = cint(131116)
const ERA_D_FMT* = cint(131118)
const ERA_D_T_FMT* = cint(131120)
const ERA_T_FMT* = cint(131121)
const ALT_DIGITS* = cint(131119)
const RADIXCHAR* = cint(65536)
const THOUSEP* = cint(65537)
const YESEXPR* = cint(327680)
const NOEXPR* = cint(327681)
const CRNCYSTR* = cint(262159)

# <locale.h>
const LC_ALL* = cint(6)
const LC_COLLATE* = cint(3)
const LC_CTYPE* = cint(0)
const LC_MESSAGES* = cint(5)
const LC_MONETARY* = cint(4)
const LC_NUMERIC* = cint(1)
const LC_TIME* = cint(2)

# <netdb.h>
const IPPORT_RESERVED* = cint(1024)
const HOST_NOT_FOUND* = cint(1)
const NO_DATA* = cint(4)
const NO_RECOVERY* = cint(3)
const TRY_AGAIN* = cint(2)
const AI_PASSIVE* = cint(1)
const AI_CANONNAME* = cint(2)
const AI_NUMERICHOST* = cint(4)
const AI_NUMERICSERV* = cint(1024)
const AI_V4MAPPED* = cint(8)
const AI_ALL* = cint(16)
const AI_ADDRCONFIG* = cint(32)
const NI_NOFQDN* = cint(4)
const NI_NUMERICHOST* = cint(1)
const NI_NAMEREQD* = cint(8)
const NI_NUMERICSERV* = cint(2)
const NI_DGRAM* = cint(16)
const EAI_AGAIN* = cint(-3)
const EAI_BADFLAGS* = cint(-1)
const EAI_FAIL* = cint(-4)
const EAI_FAMILY* = cint(-6)
const EAI_MEMORY* = cint(-10)
const EAI_NONAME* = cint(-2)
const EAI_SERVICE* = cint(-8)
const EAI_SOCKTYPE* = cint(-7)
const EAI_SYSTEM* = cint(-11)
const EAI_OVERFLOW* = cint(-12)

# <net/if.h>
const IF_NAMESIZE* = cint(16)

# <netinet/in.h>
const IPPROTO_IP* = cint(0)
const IPPROTO_IPV6* = cint(41)
const IPPROTO_ICMP* = cint(1)
const IPPROTO_ICMPV6* = cint(58)
const IPPROTO_RAW* = cint(255)
const IPPROTO_TCP* = cint(6)
const IPPROTO_UDP* = cint(17)
const INADDR_ANY* = InAddrScalar(0)
const INADDR_LOOPBACK* = InAddrScalar(2130706433)
const INADDR_BROADCAST* = InAddrScalar(4294967295)
const INET_ADDRSTRLEN* = cint(16)
const INET6_ADDRSTRLEN* = cint(46)
const IPV6_JOIN_GROUP* = cint(20)
const IPV6_LEAVE_GROUP* = cint(21)
const IPV6_MULTICAST_HOPS* = cint(18)
const IPV6_MULTICAST_IF* = cint(17)
const IPV6_MULTICAST_LOOP* = cint(19)
const IPV6_UNICAST_HOPS* = cint(16)
const IPV6_V6ONLY* = cint(26)

# <netinet/tcp.h>
const TCP_NODELAY* = cint(1)

# <nl_types.h>
const NL_SETD* = cint(1)
const NL_CAT_LOCALE* = cint(1)

# <poll.h>
const POLLIN* = cshort(1)
const POLLRDNORM* = cshort(64)
const POLLRDBAND* = cshort(128)
const POLLPRI* = cshort(2)
const POLLOUT* = cshort(4)
const POLLWRNORM* = cshort(256)
const POLLWRBAND* = cshort(512)
const POLLERR* = cshort(8)
const POLLHUP* = cshort(16)
const POLLNVAL* = cshort(32)

# <pthread.h>
const PTHREAD_BARRIER_SERIAL_THREAD* = cint(-1)
const PTHREAD_CANCEL_ASYNCHRONOUS* = cint(1)
const PTHREAD_CANCEL_ENABLE* = cint(0)
const PTHREAD_CANCEL_DEFERRED* = cint(0)
const PTHREAD_CANCEL_DISABLE* = cint(1)
const PTHREAD_CREATE_DETACHED* = cint(1)
const PTHREAD_CREATE_JOINABLE* = cint(0)
const PTHREAD_EXPLICIT_SCHED* = cint(1)
const PTHREAD_INHERIT_SCHED* = cint(0)
const PTHREAD_PROCESS_SHARED* = cint(1)
const PTHREAD_PROCESS_PRIVATE* = cint(0)
const PTHREAD_SCOPE_PROCESS* = cint(1)
const PTHREAD_SCOPE_SYSTEM* = cint(0)

# <sched.h>
const SCHED_FIFO* = cint(1)
const SCHED_RR* = cint(2)
const SCHED_OTHER* = cint(0)

# <semaphore.h>
const SEM_FAILED* = cast[pointer]((nil))

# <signal.h>
const SIGEV_NONE* = cint(1)
const SIGEV_SIGNAL* = cint(0)
const SIGEV_THREAD* = cint(2)
const SIGABRT* = cint(6)
const SIGALRM* = cint(14)
const SIGBUS* = cint(7)
const SIGCHLD* = cint(17)
const SIGCONT* = cint(18)
const SIGFPE* = cint(8)
const SIGHUP* = cint(1)
const SIGILL* = cint(4)
const SIGINT* = cint(2)
const SIGKILL* = cint(9)
const SIGPIPE* = cint(13)
const SIGQUIT* = cint(3)
const SIGSEGV* = cint(11)
const SIGSTOP* = cint(19)
const SIGTERM* = cint(15)
const SIGTSTP* = cint(20)
const SIGTTIN* = cint(21)
const SIGTTOU* = cint(22)
const SIGUSR1* = cint(10)
const SIGUSR2* = cint(12)
const SIGPOLL* = cint(29)
const SIGPROF* = cint(27)
const SIGSYS* = cint(31)
const SIGTRAP* = cint(5)
const SIGURG* = cint(23)
const SIGVTALRM* = cint(26)
const SIGXCPU* = cint(24)
const SIGXFSZ* = cint(25)
const SA_NOCLDSTOP* = cint(1)
const SIG_BLOCK* = cint(0)
const SIG_UNBLOCK* = cint(1)
const SIG_SETMASK* = cint(2)
const SA_ONSTACK* = cint(134217728)
const SA_RESETHAND* = cint(-2147483648)
const SA_RESTART* = cint(268435456)
const SA_SIGINFO* = cint(4)
const SA_NOCLDWAIT* = cint(2)
const SA_NODEFER* = cint(1073741824)
const SS_ONSTACK* = cint(1)
const SS_DISABLE* = cint(2)
const MINSIGSTKSZ* = cint(2048)
const SIGSTKSZ* = cint(8192)
const SIG_DFL* = cast[Sighandler](0)
const SIG_ERR* = cast[Sighandler](-1)
const SIG_IGN* = cast[Sighandler](1)

# <sys/ipc.h>
const IPC_CREAT* = cint(512)
const IPC_EXCL* = cint(1024)
const IPC_NOWAIT* = cint(2048)
const IPC_PRIVATE* = cint(0)
const IPC_RMID* = cint(0)
const IPC_SET* = cint(1)
const IPC_STAT* = cint(2)

# <sys/mman.h>
const PROT_READ* = cint(1)
const PROT_WRITE* = cint(2)
const PROT_EXEC* = cint(4)
const PROT_NONE* = cint(0)
const MAP_SHARED* = cint(1)
const MAP_PRIVATE* = cint(2)
const MAP_FIXED* = cint(16)
const MS_ASYNC* = cint(1)
const MS_SYNC* = cint(4)
const MS_INVALIDATE* = cint(2)
const MCL_CURRENT* = cint(1)
const MCL_FUTURE* = cint(2)
const MAP_FAILED* = cast[pointer](0xffffffffffffffff)
const POSIX_MADV_NORMAL* = cint(0)
const POSIX_MADV_SEQUENTIAL* = cint(2)
const POSIX_MADV_RANDOM* = cint(1)
const POSIX_MADV_WILLNEED* = cint(3)
const POSIX_MADV_DONTNEED* = cint(4)
const MAP_POPULATE* = cint(32768)

# <sys/resource.h>
const RLIMIT_NOFILE* = cint(7)

# <sys/select.h>
const FD_SETSIZE* = cint(1024)

# <sys/socket.h>
const MSG_CTRUNC* = cint(8)
const MSG_DONTROUTE* = cint(4)
const MSG_EOR* = cint(128)
const MSG_OOB* = cint(1)
const SCM_RIGHTS* = cint(1)
const SO_ACCEPTCONN* = cint(30)
const SO_BROADCAST* = cint(6)
const SO_DEBUG* = cint(1)
const SO_DONTROUTE* = cint(5)
const SO_ERROR* = cint(4)
const SO_KEEPALIVE* = cint(9)
const SO_LINGER* = cint(13)
const SO_OOBINLINE* = cint(10)
const SO_RCVBUF* = cint(8)
const SO_RCVLOWAT* = cint(18)
const SO_RCVTIMEO* = cint(20)
const SO_REUSEADDR* = cint(2)
const SO_SNDBUF* = cint(7)
const SO_SNDLOWAT* = cint(19)
const SO_SNDTIMEO* = cint(21)
const SO_TYPE* = cint(3)
const SOCK_DGRAM* = cint(2)
const SOCK_RAW* = cint(3)
const SOCK_SEQPACKET* = cint(5)
const SOCK_STREAM* = cint(1)
const SOL_SOCKET* = cint(1)
const SOMAXCONN* = cint(128)
const SO_REUSEPORT* = cint(15)
const MSG_NOSIGNAL* = cint(16384)
const MSG_PEEK* = cint(2)
const MSG_TRUNC* = cint(32)
const MSG_WAITALL* = cint(256)
const AF_INET* = cint(2)
const AF_INET6* = cint(10)
const AF_UNIX* = cint(1)
const AF_UNSPEC* = cint(0)
const SHUT_RD* = cint(0)
const SHUT_RDWR* = cint(2)
const SHUT_WR* = cint(1)

# <sys/stat.h>
const S_IFBLK* = cint(24576)
const S_IFCHR* = cint(8192)
const S_IFDIR* = cint(16384)
const S_IFIFO* = cint(4096)
const S_IFLNK* = cint(40960)
const S_IFMT* = cint(61440)
const S_IFREG* = cint(32768)
const S_IFSOCK* = cint(49152)
const S_IRGRP* = cint(32)
const S_IROTH* = cint(4)
const S_IRUSR* = cint(256)
const S_IRWXG* = cint(56)
const S_IRWXO* = cint(7)
const S_IRWXU* = cint(448)
const S_ISGID* = cint(1024)
const S_ISUID* = cint(2048)
const S_ISVTX* = cint(512)
const S_IWGRP* = cint(16)
const S_IWOTH* = cint(2)
const S_IWUSR* = cint(128)
const S_IXGRP* = cint(8)
const S_IXOTH* = cint(1)
const S_IXUSR* = cint(64)

# <sys/statvfs.h>
const ST_RDONLY* = cint(1)
const ST_NOSUID* = cint(2)

# <sys/wait.h>
const WNOHANG* = cint(1)
const WUNTRACED* = cint(2)
const WEXITED* = cint(4)
const WSTOPPED* = cint(2)
const WCONTINUED* = cint(8)
const WNOWAIT* = cint(16777216)

# <spawn.h>
const POSIX_SPAWN_RESETIDS* = cint(1)
const POSIX_SPAWN_SETPGROUP* = cint(2)
const POSIX_SPAWN_SETSCHEDPARAM* = cint(16)
const POSIX_SPAWN_SETSCHEDULER* = cint(32)
const POSIX_SPAWN_SETSIGDEF* = cint(4)
const POSIX_SPAWN_SETSIGMASK* = cint(8)

# <stdio.h>
const IOFBF* = cint(0)
const IONBF* = cint(2)

# <time.h>
const CLOCKS_PER_SEC* = clong(1000000)
const CLOCK_PROCESS_CPUTIME_ID* = cint(2)
const CLOCK_THREAD_CPUTIME_ID* = cint(3)
const CLOCK_REALTIME* = cint(0)
const TIMER_ABSTIME* = cint(1)
const CLOCK_MONOTONIC* = cint(1)

# <unistd.h>
const POSIX_ASYNC_IO* = cint(1)
const F_OK* = cint(0)
const R_OK* = cint(4)
const W_OK* = cint(2)
const X_OK* = cint(1)
const CS_PATH* = cint(0)
const CS_POSIX_V6_ILP32_OFF32_CFLAGS* = cint(1116)
const CS_POSIX_V6_ILP32_OFF32_LDFLAGS* = cint(1117)
const CS_POSIX_V6_ILP32_OFF32_LIBS* = cint(1118)
const CS_POSIX_V6_ILP32_OFFBIG_CFLAGS* = cint(1120)
const CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS* = cint(1121)
const CS_POSIX_V6_ILP32_OFFBIG_LIBS* = cint(1122)
const CS_POSIX_V6_LP64_OFF64_CFLAGS* = cint(1124)
const CS_POSIX_V6_LP64_OFF64_LDFLAGS* = cint(1125)
const CS_POSIX_V6_LP64_OFF64_LIBS* = cint(1126)
const CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS* = cint(1128)
const CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS* = cint(1129)
const CS_POSIX_V6_LPBIG_OFFBIG_LIBS* = cint(1130)
const CS_POSIX_V6_WIDTH_RESTRICTED_ENVS* = cint(1)
const F_LOCK* = cint(1)
const F_TEST* = cint(3)
const F_TLOCK* = cint(2)
const F_ULOCK* = cint(0)
const PC_2_SYMLINKS* = cint(20)
const PC_ALLOC_SIZE_MIN* = cint(18)
const PC_ASYNC_IO* = cint(10)
const PC_CHOWN_RESTRICTED* = cint(6)
const PC_FILESIZEBITS* = cint(13)
const PC_LINK_MAX* = cint(0)
const PC_MAX_CANON* = cint(1)
const PC_MAX_INPUT* = cint(2)
const PC_NAME_MAX* = cint(3)
const PC_NO_TRUNC* = cint(7)
const PC_PATH_MAX* = cint(4)
const PC_PIPE_BUF* = cint(5)
const PC_PRIO_IO* = cint(11)
const PC_REC_INCR_XFER_SIZE* = cint(14)
const PC_REC_MIN_XFER_SIZE* = cint(16)
const PC_REC_XFER_ALIGN* = cint(17)
const PC_SYMLINK_MAX* = cint(19)
const PC_SYNC_IO* = cint(9)
const PC_VDISABLE* = cint(8)
const SC_2_C_BIND* = cint(47)
const SC_2_C_DEV* = cint(48)
const SC_2_CHAR_TERM* = cint(95)
const SC_2_FORT_DEV* = cint(49)
const SC_2_FORT_RUN* = cint(50)
const SC_2_LOCALEDEF* = cint(52)
const SC_2_PBS* = cint(168)
const SC_2_PBS_ACCOUNTING* = cint(169)
const SC_2_PBS_CHECKPOINT* = cint(175)
const SC_2_PBS_LOCATE* = cint(170)
const SC_2_PBS_MESSAGE* = cint(171)
const SC_2_PBS_TRACK* = cint(172)
const SC_2_SW_DEV* = cint(51)
const SC_2_UPE* = cint(97)
const SC_2_VERSION* = cint(46)
const SC_ADVISORY_INFO* = cint(132)
const SC_AIO_LISTIO_MAX* = cint(23)
const SC_AIO_MAX* = cint(24)
const SC_AIO_PRIO_DELTA_MAX* = cint(25)
const SC_ARG_MAX* = cint(0)
const SC_ASYNCHRONOUS_IO* = cint(12)
const SC_ATEXIT_MAX* = cint(87)
const SC_BARRIERS* = cint(133)
const SC_BC_BASE_MAX* = cint(36)
const SC_BC_DIM_MAX* = cint(37)
const SC_BC_SCALE_MAX* = cint(38)
const SC_BC_STRING_MAX* = cint(39)
const SC_CHILD_MAX* = cint(1)
const SC_CLK_TCK* = cint(2)
const SC_CLOCK_SELECTION* = cint(137)
const SC_COLL_WEIGHTS_MAX* = cint(40)
const SC_CPUTIME* = cint(138)
const SC_DELAYTIMER_MAX* = cint(26)
const SC_EXPR_NEST_MAX* = cint(42)
const SC_FSYNC* = cint(15)
const SC_GETGR_R_SIZE_MAX* = cint(69)
const SC_GETPW_R_SIZE_MAX* = cint(70)
const SC_HOST_NAME_MAX* = cint(180)
const SC_IOV_MAX* = cint(60)
const SC_IPV6* = cint(235)
const SC_JOB_CONTROL* = cint(7)
const SC_LINE_MAX* = cint(43)
const SC_LOGIN_NAME_MAX* = cint(71)
const SC_MAPPED_FILES* = cint(16)
const SC_MEMLOCK* = cint(17)
const SC_MEMLOCK_RANGE* = cint(18)
const SC_MEMORY_PROTECTION* = cint(19)
const SC_MESSAGE_PASSING* = cint(20)
const SC_MONOTONIC_CLOCK* = cint(149)
const SC_MQ_OPEN_MAX* = cint(27)
const SC_MQ_PRIO_MAX* = cint(28)
const SC_NGROUPS_MAX* = cint(3)
const SC_OPEN_MAX* = cint(4)
const SC_PAGE_SIZE* = cint(30)
const SC_PRIORITIZED_IO* = cint(13)
const SC_PRIORITY_SCHEDULING* = cint(10)
const SC_RAW_SOCKETS* = cint(236)
const SC_RE_DUP_MAX* = cint(44)
const SC_READER_WRITER_LOCKS* = cint(153)
const SC_REALTIME_SIGNALS* = cint(9)
const SC_REGEXP* = cint(155)
const SC_RTSIG_MAX* = cint(31)
const SC_SAVED_IDS* = cint(8)
const SC_SEM_NSEMS_MAX* = cint(32)
const SC_SEM_VALUE_MAX* = cint(33)
const SC_SEMAPHORES* = cint(21)
const SC_SHARED_MEMORY_OBJECTS* = cint(22)
const SC_SHELL* = cint(157)
const SC_SIGQUEUE_MAX* = cint(34)
const SC_SPAWN* = cint(159)
const SC_SPIN_LOCKS* = cint(154)
const SC_SPORADIC_SERVER* = cint(160)
const SC_SS_REPL_MAX* = cint(241)
const SC_STREAM_MAX* = cint(5)
const SC_SYMLOOP_MAX* = cint(173)
const SC_SYNCHRONIZED_IO* = cint(14)
const SC_THREAD_ATTR_STACKADDR* = cint(77)
const SC_THREAD_ATTR_STACKSIZE* = cint(78)
const SC_THREAD_CPUTIME* = cint(139)
const SC_THREAD_DESTRUCTOR_ITERATIONS* = cint(73)
const SC_THREAD_KEYS_MAX* = cint(74)
const SC_THREAD_PRIO_INHERIT* = cint(80)
const SC_THREAD_PRIO_PROTECT* = cint(81)
const SC_THREAD_PRIORITY_SCHEDULING* = cint(79)
const SC_THREAD_PROCESS_SHARED* = cint(82)
const SC_THREAD_SAFE_FUNCTIONS* = cint(68)
const SC_THREAD_SPORADIC_SERVER* = cint(161)
const SC_THREAD_STACK_MIN* = cint(75)
const SC_THREAD_THREADS_MAX* = cint(76)
const SC_THREADS* = cint(67)
const SC_TIMEOUTS* = cint(164)
const SC_TIMER_MAX* = cint(35)
const SC_TIMERS* = cint(11)
const SC_TRACE* = cint(181)
const SC_TRACE_EVENT_FILTER* = cint(182)
const SC_TRACE_EVENT_NAME_MAX* = cint(242)
const SC_TRACE_INHERIT* = cint(183)
const SC_TRACE_LOG* = cint(184)
const SC_TRACE_NAME_MAX* = cint(243)
const SC_TRACE_SYS_MAX* = cint(244)
const SC_TRACE_USER_EVENT_MAX* = cint(245)
const SC_TTY_NAME_MAX* = cint(72)
const SC_TYPED_MEMORY_OBJECTS* = cint(165)
const SC_TZNAME_MAX* = cint(6)
const SC_V6_ILP32_OFF32* = cint(176)
const SC_V6_ILP32_OFFBIG* = cint(177)
const SC_V6_LP64_OFF64* = cint(178)
const SC_V6_LPBIG_OFFBIG* = cint(179)
const SC_VERSION* = cint(29)
const SC_XBS5_ILP32_OFF32* = cint(125)
const SC_XBS5_ILP32_OFFBIG* = cint(126)
const SC_XBS5_LP64_OFF64* = cint(127)
const SC_XBS5_LPBIG_OFFBIG* = cint(128)
const SC_XOPEN_CRYPT* = cint(92)
const SC_XOPEN_ENH_I18N* = cint(93)
const SC_XOPEN_LEGACY* = cint(129)
const SC_XOPEN_REALTIME* = cint(130)
const SC_XOPEN_REALTIME_THREADS* = cint(131)
const SC_XOPEN_SHM* = cint(94)
const SC_XOPEN_STREAMS* = cint(246)
const SC_XOPEN_UNIX* = cint(91)
const SC_XOPEN_VERSION* = cint(89)
const SC_NPROCESSORS_ONLN* = cint(84)
const SEEK_SET* = cint(0)
const SEEK_CUR* = cint(1)
const SEEK_END* = cint(2)
