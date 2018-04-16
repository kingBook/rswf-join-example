rebol [
	purpose: "Compile and run Game.rswf"
]

do %rswf.txt

either error? set/any 'err try [
	make-swf/save %Game.rswf 
	rswf/init 
	recycle
] [
	print "!!!ERROR!!!" 
	probe disarm err 
	ask   "[press enter to quit]"
] [
	print "===================="
	print "=== STARTING APP ==="
	print "====================^/"
	change-dir %public/
	call/console "adl Game.xml"
] 