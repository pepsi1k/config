#include <iostream>
#include <cstring>
#include <cctype> // isdigin()
#include <cstdlib> // atoi()
#include <ctime>

int main(int argc, char* argv[]) {
	srand(time(NULL));

	int length;
	if (argc == 2) {
		for (int i = 0; i < strlen(argv[1]); i++) {
			if (!isdigit(argv[1][i])) {
				std::cout << "length must be digit" << std::endl;
				return 0;
			}
		}
		length = atoi(argv[1]);

	} else {
		std::cout << "random-pass [length]" << std::endl;
		return 0;
	}
	
	const char letters[] = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+-=?<>";
	char lengthLetters = strlen(letters);


	std::string pass = "";
	for (int i = 0; i < length; i++) {
		pass += letters[rand() % lengthLetters];
	}

	std::cout << pass << std::endl;
}
