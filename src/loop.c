#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main (int argc, char * argv[]){
	int x,i;
	if (argc==0){
		printf("Error: No argument input\n");
		goto end;
	}
	else{
		x = strtol(argv[1], NULL, 10);
		goto loop;
	}

	loop:
		for(i=0; i<x; i++){
			sleep(1);
		}
		goto end;

	end:
		return 0;
}
