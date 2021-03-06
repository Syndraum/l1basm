SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
SRCB = ft_atoi_base_bonus.s ft_strstr.s ft_list_push_front_bonus.s \
		ft_list_size_bonus.s ft_list_sort_bonus.s ft_list_remove_if_bonus.s
SRCC = main.c 
SRCM = bonus.c ft_atoi_base.c list.c

OBJS = ${SRCS:.s=.o}
OBJB = ${SRCB:.s=.o}
OBJC = ${SRCC:.c=.o}
OBJM = ${SRCM:.c=.o}

NAME = libasm.a
NAME_TEST = libasm.out

RM	= rm -f

CC = gcc

CFLAG = -Wall -Wextra -Werror

all:	${NAME}

.s.o:
	nasm -fmacho64 $<

.c.o:
	${CC} ${CFLAG} -c  $< -o ${<:.c=.o}

all: ${NAME}

${NAME}: ${OBJS} header.h
	ar rc ${NAME} ${OBJS}

bonus: ${OBJS} ${OBJB} header.h bonus.h
	ar rc ${NAME} ${OBJS} ${OBJB}

test: ${NAME_TEST}

${NAME_TEST}:	${NAME} ${OBJC}
	${RM} $(OBJM)
	${CC} ${NAME} ${OBJC} -o ${NAME_TEST}

more:	bonus ${OBJM}
	${RM} $(OBJC)
	${CC} ${NAME} ${OBJM} -o ${NAME_TEST}

clean :
	${RM} ${OBJS} ${OBJC} ${OBJB} ${OBJM}

fclean:	clean
	${RM} ${NAME}
	${RM} ${NAME_TEST}

re: 	fclean all