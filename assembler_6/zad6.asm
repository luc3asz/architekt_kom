.model small
.386
.data
	bufor dd 0
	dzie db "d=","$"			; dziesietnie
	dwoj db "b=","$"			; dwojkowo
	osem db "o","$"				; osemkowo
.stack 100h
.code
start:
	mov eax, @data
	mov ds, eax
	mov eax, 0
	mov eax, 0				; przypisujemy wartosc do rejestru eax
	mov bufor, eax 				; w tym przypadku jest to 123
		
	dzie_licz:					; system dziesietny
		mov eax, bufor
		mov esp, 0
		
		dzie_licz_petla: 		; petla dziesietny
			mov ebx, 0
			mov edx, 0			
			mov bl, 10
			div ebx					
			add edx, 30h			
			push edx			
			cmp eax, 0
			je dzie_wysw
		jmp dzie_licz_petla	
			
	dzie_wysw: 					; wyswietlanie dziesietny
	
		dzie_wysw_petla:
			cmp esp, 0
			je dzie_wysw_znak
			pop edx
			mov ah, 0Eh
			mov al, dl
			int 10h
			jmp dzie_wysw_petla
	
		dzie_wysw_znak:
			mov dx, offset dzie
			mov ah, 09h
			int 21h	
			mov eax, 0
			mov eax, bufor
	
	jmp dwojkowy
	
	dwojkowy:
	
	dwoj_licz:					; system dwojkowy
		mov eax, bufor
		mov esp, 0
		
		dwoj_licz_petla: 		; dwojkowy petla
			mov ebx, 0
			mov edx, 0			
			mov bl, 2
			div ebx					
			add edx, 30h			
			push edx			
			cmp eax, 0
			je dwoj_wysw
		jmp dwoj_licz_petla	
			
	dwoj_wysw: 					; dwojkowy wyswietlanie
	
		dwoj_wysw_petla:
			cmp esp, 0
			je dwoj_wysw_znak
			pop edx
			mov ah, 0Eh
			mov al, dl
			int 10h
			jmp dwoj_wysw_petla
	
		dwoj_wysw_znak:
			mov dx, offset dwoj
			mov ah, 09h
			int 21h	
			mov eax, 0
			mov eax, bufor
	
	jmp osemkowy
	
	osemkowy:
	
	osem_licz:					; system osemkowy
		mov eax, bufor
		mov esp, 0
		
		osem_licz_petla: 		; osemkowy petla
			mov ebx, 0
			mov edx, 0			
			mov bl, 8
			div ebx					
			add edx, 30h			
			push edx			
			cmp eax, 0
			je osem_wysw
		jmp osem_licz_petla	
			
	osem_wysw: 					; osemkowy wyswietlanie
	
		osem_wysw_petla:
			cmp esp, 0
			je osem_wysw_znak
			pop edx
			mov ah, 0Eh
			mov al, dl
			int 10h
			jmp osem_wysw_petla
	
		osem_wysw_znak:
			mov dx, offset osem
			mov ah, 09h
			int 21h	
			mov eax, 0
			mov eax, bufor
	
	mov ah, 4Ch
	int 21h  	
	
end start