-include config.$(MAKECMDGOALS)
none:
	@echo "Available targets:"
	@echo " make lua52 - to build against Lua 5.2 (config.lua52)"
	@echo " make lua51 - to build against Lua 5.1 (config.lua51)"
	@echo " make lj    - to build against LuaJIT (config.lj)"
	@echo " make ljx   - to build against LJX (config.ljx)"
lua52: c-gmp.so
lua51: c-gmp.so
lj: c-gmp.so
ljx: c-gmp.so
c-gmp.so: lgmp.c
	$(CC) $(INC) $(LIB) -shared -lgmp -O2 -fPIC -Wl,-soname,c-gmp.so -o c-gmp.so lgmp.c
	@echo "To install system-wide run:"
	@echo "  sudo cp gmp.lua $(LDIR)"
	@echo "  sudo cp c-gmp.so $(CDIR)"
clean:
	rm -f *.so
