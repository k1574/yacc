<mkconfig
SYN = syn.y
#HDR = `{ls *.h}
SRC = `{ls *.c}
OBJ = ${SRC:%.c=%.o}
TGT = $NAME
all :Q: $TGT 
	echo -n
strip :V: $TGT
	$STRIP $TGT
$TGT : x.tab.h $OBJ
	$LD -o $target $LDFLAGS $OBJ $LIB
%.o :V: %.c
	$CC -c -o $target $CPPFLAGS $CFLAGS $stem.c
%.c :Q: $HDR x.tab.h
	touch $target
%.h :Q:
	touch $target
clean :V:
	rm -rf $TGT *.o y.tab.c y.tab.h x.tab.h
install :V: $TGT strip
	mkdir -p $BIN
	cp -f $TGT $BIN/
	chmod 0755 $BIN/$TGT
uninstall :V:
	rm -f $BIN/$TGT
