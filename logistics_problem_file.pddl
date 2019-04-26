(define (problem p-1)
  (:domain MAZE)
  (:objects       t0001 t0002 t0003 - truck
                  w0001 w0002 w0003 w0004 - warehouse
                  r0001 r0002 r0003 r0004 r0005 r0006 - road
                  wo0001 wo0002 - workorder
  )
  (:INIT
		(= (total-expense) 0)
                ;; About trucks
                (truck-at t0001 w0001) (truck-idle t0001) ;truck 1 is idle and is at warehouse 1
                (truck-at t0002 w0002) (truck-idle t0002) ;truck 2 is idle and is at warehouse 2
                (truck-at t0003 w0001) (truck-idle t0003) ;truck 3 is idle and is at warehouse 1
                (truck-healthy t0001)                     ;truck 1 is healthy
                (truck-healthy t0002)                     ;truck 2 is healthy
                ;(truck-healthy t0003)                    ;truck 3 is healthy        
                (= (freespace t0001) 100)                 ;freespace in truck 1 
                (= (freespace t0002) 100)                 ;freespace in truck 1 
                (= (freespace t0003) 100)                 ;freespace in truck 1 
		

                ;; About roads
		; Note we have w0001 w0002 and w0004 connected as a start with w0003 in 
		; the middle, with weights such that it is attractive to 
		; transport  from w0001 and w0002 to w0003 and then transfer before
		; proceeding in a single truck to w0004
                (links r0002 w0001 w0003) (links r0002 w0003 w0001) (= (takestime r0002)  100) ;route 2 which links the warehouses 1 and 3 in both directions 
                (links r0003 w0002 w0003) (links r0003 w0003 w0002) (= (takestime r0003)  100) ;route 3 which links the warehouses 2 and 3 in both directions
                (links r0006 w0004 w0003) (links r0006 w0003 w0004) (= (takestime r0006) 2000) ;route 6 which links the warehouses  and 3 in both directions

                ;; About warehouses
                (= (wh-stock w0001)  100)
                (= (wh-stock w0002)  100)
                (= (wh-stock w0003)  0)
                (= (wh-stock w0004)  0)
                (= (wh-loadtime w0001) 5)
                (= (wh-loadtime w0002) 5)
                (= (wh-loadtime w0003) 5)
                (= (wh-loadtime w0004) 5)
                (= (wh-unloadtime w0001) 5)
                (= (wh-unloadtime w0002) 5)
                (= (wh-unloadtime w0003) 5)
                (= (wh-unloadtime w0004) 5)
 
		(= (wh-xfertime) 5)

                ;; About workorders
                (wo-dest wo0001 w0004) 
                (wo-src wo0001 w0001) 
                (= (wo-stock wo0001) 40)
                (= (wo-timelimit wo0001) 150)
                (= (wo-quality wo0001) 80)
		 (yettoload wo0001)
		 (yettoload wo0002)

                (wo-dest wo0002 w0004)
                (wo-src wo0002 w0002)
                (= (wo-stock wo0002) 70)
                (= (wo-timelimit wo0002) 150)
                (= (wo-quality wo0002) 80)


  )

;; find schedule of tasks to people so that they all get done asap
  (:goal (and (delivered wo0001 w0004) 
	      (delivered wo0002 w0004) 
            ;;  (>= (total-time) (wo-timelimit wo0001)) 
         )
  )

;;  (:metric minimize (total-time))
  (:metric minimize (+ (total-expense) (total-time)) )

)
