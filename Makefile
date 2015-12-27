OUT_DIR = ./out

.PHONY: \
	build \
	watch \
	server \
	install \
	install-lapis \
	install-moonscript \
	clean \
	;

build:
	mkdir -p ${OUT_DIR};
	moonc \
		-o ${OUT_DIR}/app.lua \
		src/app.moon \
	;

watch:
	moonc \
		-w src/app.moon \
		-o ${OUT_DIR}/app.lua \
		src/app.moon
	;

server:
	lapis server

install-lapis:
	luarocks install lapis

install-moonscript:
	luarocks install moonscript

install: ; ${MAKE} -j2 install-lapis install-moonscript

clean:
	rm -rf ${OUT_DIR};
