NAME	=		graph

SRC_DIR		=	$(CURDIR)/src

OBJ_DIR		=	$(CURDIR)/obj

INCLUDE_DIR	=	$(CURDIR)/include

SRC		=	$(SRC_DIR)/main.cpp\
				$(SRC_DIR)/graph.cpp

OBJ		=	$(SRC:.cpp=.o)
OBJ		:=	$(subst $(SRC_DIR),$(OBJ_DIR),$(OBJ))

CXX		=	clang++

INCLUDE		=	-I $(INCLUDE_DIR)

LDFLAGS		=	

DEBUG		=	no

ifeq ($(DEBUG), no)
		OPTI	=	-O3
else
		OPTI	=	-g
endif

CXXFLAGS	=	-Wall -Wextra -Werror $(INCLUDE) $(OPTI)

ECHO		=	/bin/echo

$(NAME):	printflag $(OBJ)
		@$(ECHO) "$(BLUE)Linking $(NAME)...$(NOCOLOR)"
		@$(CXX) $(CXXFLAGS) $(OBJ) -o $(NAME) $(LDFLAGS)
		@$(ECHO) "$(GREEN)Done.$(NOCOLOR)"

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.cpp
		@$(ECHO) "Compiling `basename $<`"
		@$(CXX) $(LDFLAGS) $(CXXFLAGS) $< -c -o $@

all:		$(NAME)

clean:
		@rm -f $(OBJ)
		@$(ECHO) "Removed $(OBJ)"

fclean:
		@rm -f $(NAME)
		@$(ECHO) "Removed $(NAME)"
		@rm -f $(OBJ)
		@$(ECHO) "Removed $(OBJ)"

re:		fclean print all

printflag:
		@$(ECHO) "---FLAGS---"
		@$(ECHO) "$(CXXFLAGS)"
		@$(ECHO) "-----------"

print:
		@$(ECHO) "---Making all---"

debug:		fclean print
		@make -s DEBUG=yes

release:	fclean print
		@make -s DEBUG=no
