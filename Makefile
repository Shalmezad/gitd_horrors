TARGET=neko
FLAGS="-D MATH_RANDOM_INTRANGED=1"
build:
	lime build neko $(FLAGS)
clean:
	lime clean neko
run:
	lime run neko
measure:
	@echo "Source files line count: "
	@find source/ -name '*.hx' | xargs wc -l
android:
	lime build android
	lime run android	
