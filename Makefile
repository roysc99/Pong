
TARGET      	:=  $(notdir $(CURDIR))
BUILD       	:=  build
LIBBUTANO   	:=  ./butano
PYTHON      	:=  python
SOURCES     	:=  src /src
INCLUDES    	:=  include /butano/include
DATA        	:= 
GRAPHICS    	:=  graphics /graphics
AUDIO       	:=  
DMGAUDIO    	:=  
ROMTITLE    	:=  PONG
ROMCODE     	:=  SBTP
USERFLAGS   	:= 
USERASFLAGS 	:=  
USERLDFLAGS 	:=  
USERLIBDIRS 	:=  
USERLIBS    	:=  
DEFAULTLIBS 	:=  
STACKTRACE		:=	
USERBUILD   	:=  
EXTTOOL     	:=  


#---------------------------------------------------------------------------------------------------------------------
# Export absolute butano path:
#---------------------------------------------------------------------------------------------------------------------
ifndef LIBBUTANOABS
	export LIBBUTANOABS	:=	$(realpath $(LIBBUTANO))
endif

#---------------------------------------------------------------------------------------------------------------------
# Include main makefile:
#---------------------------------------------------------------------------------------------------------------------
include $(LIBBUTANOABS)/butano.mak
