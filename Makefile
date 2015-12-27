OUT_DIR = ./out

LIB_NAME = gateway

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
		-o ${OUT_DIR}/${LIB_NAME}.lua \
		src/${LIB_NAME}.moon \
	;

watch:
	moonc \
		-w src/app.moon \
		-o ${OUT_DIR}/${LIB_NAME}.lua \
		src/${LIB_NAME}.moon
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
