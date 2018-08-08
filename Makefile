##
## EPITECH PROJECT, 2017
## Makefile
## File description:
## makefile of the source file
##

ROOT	=		.

SRC_DIR	=		sources

NASM	=		nasm

NAME	=		libasm.so

BUILD	=		$(ROOT)/build

SRC	=		$(SRC_DIR)/strlen.asm		\
			$(SRC_DIR)/strchr.asm		\
			$(SRC_DIR)/memset.asm		\
			$(SRC_DIR)/memcpy.asm		\
			$(SRC_DIR)/strcmp.asm		\
			$(SRC_DIR)/memmove.asm		\
			$(SRC_DIR)/strncmp.asm		\
			$(SRC_DIR)/rindex.asm		\
			$(SRC_DIR)/strcasecmp.asm	\
			$(SRC_DIR)/strcspn.asm		\
			$(SRC_DIR)/strpbrk.asm		\
			$(SRC_DIR)/strstr.asm


WARN	=		-W -Wall -Wextra

LIB	?=		1

TEST	?=		0

DEB	?=      	0

G	=		-g -D DEBUG

V	?=		@

CC	=		gcc

ASMFLAGS=		-f elf64

OBJS	=		$(patsubst $(SRC_DIR)/%.asm, $(BUILD)/%.o, $(SRC))

CFLAGS	=		-shared -fPIC

#COLOR

GREEN	=		\e[1;32m

WHITE	=		\e[0m

ORANGE	=		\e[1;33m

RED	=		\e[1;35m

BLUE	=		\e[1;34m

debug:			CFLAGS += $(G)
debug:			ASMFLAGS += $(G)

all:			$(NAME)

$(NAME):		$(BUILD)/$(NAME)
			$(V)cp $(BUILD)/$(NAME) $(ROOT)
			$(V)printf "$(GREEN)Dup $(NAME) into root directory.$(WHITE)\n"

debug:			fclean echo_d $(NAME)

$(BUILD)/$(NAME):	$(OBJS)
			$(V)printf "$(GREEN)Compile sources.$(WHITE)\n"
			$(V)$(CC) $(CFLAGS) -o $(BUILD)/$(NAME) $(OBJS) 
			$(V)printf "$(GREEN)Linking obj and Libraries.$(WHITE)\n"

$(BUILD)/%.o:		$(SRC_DIR)/%.asm
			$(V)mkdir -p $(dir $@)
			$(V)printf "$(BLUE)Compiling [$(GREEN)$(notdir $<)$(BLUE) -> $(RED)$(notdir $@)$(BLUE)]\n$(WHITE)"
			$(V)$(NASM) $(ASMFLAGS) $< -o $@ 

clean:
			$(V)rm -rf $(OBJS)
			$(V)printf "$(ORANGE)Removing object files.$(WHITE)\n"

fclean:			clean
			$(V)rm -f $(BUILD)/$(NAME)
			$(V)rm -f $(ROOT)/$(NAME)
			$(V)printf "$(ORANGE)Removing binary file.$(WHITE)\n"

re:			fclean
			$(V)make --no-print-directory all

echo_build:
			$(V)printf "$(GREEN)Begin of the build !\n$(ORANGE)Warnings : \n$(WHITE)"

echo_d:
			$(V)printf "$(RED)DEBUG MODE initialized.$(WHITE)\n";

.PHONY: clean fclean debug all re echo_debug buildrepo
