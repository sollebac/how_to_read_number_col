program smear
  !!! Jose Luis Cabellos 
  !!! Sat Sep 29 12:45:33 MST 2018
  !!! 
  implicit none
  integer, PARAMETER :: DP = KIND(1.d0)
  integer :: IArgC,ArgC,isthis
  integer :: iteracion,i,j,NofL,NofC
  integer :: ioerror, nMax
  REAL(DP) :: inputdata(2) 
  REAL(DP),allocatable :: mydato(:) 
  REAL(DP),allocatable :: fx(:) 
  REAL(DP),allocatable :: xx(:) 
  REAL(DP) :: lambda 
  character :: ArgV(4)*20
  character(len=20) :: filein
  character(len=20) :: fileout
  logical :: filexist
!!!==========begin executable===============
!!!...
!!!...
  ArgC=IArgC() !number of arguemnts
  if (ArgC==1) then
     do isthis=1,ArgC
        call GetArg(isthis,ArgV(isthis))
        filein=ArgV(1)
     enddo
         else
            write(*,*) " Usage: smear [file] "
            write(*,*) " ---------------------------"
            write(*,*) " Examples: ./smear file.dat "
            write(*,*) " Copyright(C) 2006 Free Software "
            write(*,*) " This is free software;.There is NO warranty"
            write(*,*) " Version 0.1 "
            write(*,*) " with colaboration: Jose Luis Cabellos "
            write(*,*) " Last Modification: 11 Enero 2008 at 10:08"
            stop
 endif
  filein=trim(filein)
   !Checking the existence of data file
     inquire (file=filein,exist=filexist)
       if (.NOT. filexist) then
          write(*,*)'Error, missing file: ',filein
          stop
       end if
           write(*,*) "The input FILE is: ", filein
            fileout="sm."//filein
             write(*,*) "The output FILE is: ", fileout
!!!================================
             call  NumberofLines(NofL,filein)
              write(*,*)'Number of Lines ',NofL
 

            call  NumberofCol(NofC,filein)
              write(*,*)'Number of Lines ',NofC

           stop

end program smear
!! hi there are 2  other subroutine under here 
!! NumberofLines(NofL,filein)



subroutine NumberofLines(NofL,filein) 
!! function :: count the number of lines of the file "zeta.dat"
!!             the same with  awk '{print NR}' zeta.dat
implicit none
integer,PARAMETER :: DP=KIND(1.d0)
REAL(DP) :: intmpx, intmpf(6)
REAL(DP) :: inputdata(2) 
integer, intent(out) :: NofL
integer :: i,ioerror
character(len=20) :: filein
 
 OPEN(10,FILE=filein ) 
 i=0 
do 
 READ(10,FMT=*,IOSTAT=ioerror)inputdata(1:2) 
  IF (ioerror==0) THEN 
      i=i+1
    ELSE IF (ioerror == -1) THEN
          IF (i == 0) THEN
           close(10)
           return
          END IF
        NofL = i
          close(10)
          return
       ELSE
          STOP 'ERROR,line=130 mysmear4.f90 your file is empty  Maybe... '
       END IF
    ENDDO   
end subroutine NumberofLines


 subroutine NumberofCol(NofC,filein)
 integer, intent(out) :: NofC
 character(len=20) :: filein
 real :: value
  integer::i,j,number,error
  character(180) :: s
  OPEN(10,FILE=filein ) 
    read (10,'(a)') s
  do i=1, 180
      read(s, *, iostat = error) ( value, j=1,i)
      if ( error.ne.0) then
         number = i - 1
         exit
      endif
  end do
  NofC = number
  close(10)
 end subroutine NumberofCol




