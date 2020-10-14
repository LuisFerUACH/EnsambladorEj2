.data
	UN_DOS DQ 2 
	INICIALIZAR DQ 0
	datos DQ 10 ,20 ,30 ,40 ,50, 60
	suma1 DQ 0
	suma2 DQ 0
.code
;; La funcion principal del programa
	main proc
		;;SUMA1
		lea rcx , datos ;; RCX=dir arreglo(rcx es el registro para el primer argumento)
 		mov rdx ,6 ;; RDX= num. elementos (rdx es el registro para el segundo argumento)
		call sumatoria1 ;;llamar la funcion sumatoria1
		mov suma1 , rax ;; suma=RAX=sumatoria1
		
		;;SUMA2
		lea rcx , datos ;; RCX=dir arreglo 
 		mov rdx ,6 ;; RDX= num. elementos 
		call sumatoria2 ;;llamar la funcion sumatoria2
		mov suma2 , rax ;; suma=RAX=sumatoria1
		
	ret
main endp
	
	
sumatoria1 proc
	mov rbx,rcx ;; RBX = dir. arreglo (primer argumento)
	mov rcx,rdx ;; RCX= num. elementos (segundo argumento)
	mov rax, INICIALIZAR ;; RAX = 0;
	ciclo:
		add rax, qword ptr[rbx] ;;RAX=RAX + datos[rbx];
		add rbx, 8 ;;iteramos la posicion del arreglo 
		loop ciclo ;; Terminamos el ciclo
		ret
sumatoria1 endp

sumatoria2 proc
	mov rbx,rcx ;; RBX = dir. arreglo (primer argumento)
	mov rcx,rdx ;; RCX= num. elementos (segundo argumento)
	mov rax, INICIALIZAR ;; RAX = 0;
	ciclo:
		add rax, qword ptr[rbx] ;;RAX=RAX + datos[rbx];
		sub rax,UN_DOS ;;restamos 2 al valor en RAX
		add rbx, 8 ;;iteramos la posicion del arreglo 
		loop ciclo ;; Terminamos el ciclo
		ret
sumatoria2 endp
end