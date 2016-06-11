clean:
	rm -f cool-parser.cc
	rm -f *.o

bison:
	bison -Wno-other -d -v -y -b cool --debug -p cool_yy cool.y
	mv cool.tab.c cool-parser.cc

parser: bison
	clang++ -Wall -Iinclude -stdlib=libc++ -c cool-parser.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/parser-phase.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/utilities.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/stringtab.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/dumptype.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/tree.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/cool-tree.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/tokens-lex.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -c course/handle_flags.cc
	clang++ -Wall -Iinclude -stdlib=libc++ -ll -o bin/parser \
		cool-parser.o \
		parser-phase.o \
		utilities.o \
		stringtab.o \
		dumptype.o \
		tree.o \
		cool-tree.o \
		tokens-lex.o \
		handle_flags.o
