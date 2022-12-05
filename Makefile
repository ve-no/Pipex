NAME = pipex

CC = clang

CFLAGS = -Wall -Wextra -Werror

INC = ./inc/pipex.h

SRC = ./src/pipex.c ./src/string_utils.c ./src/pipex_utils.c

OBJ = $(SRC:c=o)

SRCB = ./src/bonus.c ./src/string_utils.c ./src/pipex_utils.c

OBJB = $(SRCB:c=o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "\033[0;32m\n\nCompiling pipex..."
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJ)
	@echo "\n\033[0mDone !"

%.o: %.c
	@printf "\033[0;33mGenerating pipex objects... %-300.300s\r" $@
	@${CC} ${CFLAGS} -c $< -o $@

clean:
	@echo "\033[0;31m\nDeleting objects..."
	@rm -f $(OBJ) $(OBJB)
	@echo "\033[0m"

fclean:
	@echo "\033[0;31m\nDeleting objects..."
	@rm -f $(OBJ) $(OBJB)
	@echo "\nDeleting executable..."
	@rm -f $(NAME)
	@echo "\033[0m"

re: fclean all

bonus: $(OBJB)
	@echo "\033[0;32m\n\nCompiling pipex (with bonuses)..."
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJB)
	@echo "\n\033[0mDone !"

.PHONY: clean fclean re bonus
