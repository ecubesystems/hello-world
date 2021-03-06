!     ************************************
!     * Client Proxy Procedure Code
!     *    generated by rpcmake
!     *    on Friday, April 13, 2018 at 16:58:13
!     *    
!     * interface: basicsrv 
!     *    
!     ************************************

SUB add(  & 
                X,  &
                Y,  &
                DCE-RESULT) 
 EXTERNAL FUNCTION dce_find_server(   &
                   STRING BY DESC,  &
                   INTEGER BY REF,  &
                   INTEGER BY REF)  
 DECLARE INTEGER SOCKET 
 DECLARE STRING SERVER_NAME 
 SERVER_NAME="add" 
      CALL dce_checkver ( &
                , &
                )

           CALL dce_findserver_ref ( SERVER_NAME , SOCKET) 
           IF SOCKET >= 0 
                 CBUFFER$ = 'x' + STRING$(1%, 0%)
                 CALL dce_push_int_vms_ref(SOCKET, CBUFFER$, x)
                 CBUFFER$ = 'y' + STRING$(1%, 0%)
                 CALL dce_push_int_vms_ref(SOCKET, CBUFFER$, y)
                CALL dce_submit_ref (SERVER-NAME,   &
                     CBUFFER$, SOCKET, DCE_TABLE )

                 LET strng= SPACE$(100)
                 LET CBUFFER$= "dce_result" + STRING$(1%, 0%) 
                 CALL dce_pop_int_vms_ref(DCE_TABLE, CBUFFER$, dce_result)
                CALL dce_table_destroy_ref ( DCE_TABLE)
                CALL dce_release_ref
           END IF 
      END SUB 



SUB lower2upper(  & 
                S1,  &
                S2,  &
                DCE-RESULT) 
 EXTERNAL FUNCTION dce_find_server(   &
                   STRING BY DESC,  &
                   INTEGER BY REF,  &
                   INTEGER BY REF)  
 DECLARE INTEGER SOCKET 
 DECLARE STRING SERVER_NAME 
 SERVER_NAME="lower2upper" 
      CALL dce_checkver ( &
                , &
                )

           CALL dce_findserver_ref ( SERVER_NAME , SOCKET) 
           IF SOCKET >= 0 
                 CBUFFER$ = 's1' + STRING$(1%, 0%)
                 D_MAGS = 50
                 CALL dce_push_char_str_vms_ref    &
             ( SOCKET, CBUFFER$,     &
              s1$, D_MAGS)
                CALL dce_submit_ref (SERVER-NAME,   &
                     CBUFFER$, SOCKET, DCE_TABLE )

                 LET strng= SPACE$(100)
                 LET CBUFFER$= "s2" + STRING$(1%, 0%) 
                 D_MAGS = 50
                 CALL dce_pop_char_str_vms_ref   &
                 (DCE_TABLE, CBUFFER$,   &
                s2, D_MAGS)
                 LET CBUFFER$= "dce_result" + STRING$(1%, 0%) 
                 CALL dce_pop_int_vms_ref(DCE_TABLE, CBUFFER$, dce_result)
                CALL dce_table_destroy_ref ( DCE_TABLE)
                CALL dce_release_ref
           END IF 
      END SUB 


