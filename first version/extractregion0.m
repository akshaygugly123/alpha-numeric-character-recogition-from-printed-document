function [regions, noofregions]=extractregion0(input)
    regions=0;
    noofregions=0;
    [rows,columns]=size(input);
    visited(rows,columns)=0;
    for i=1:rows
        for j=1:columns
            if  (input(i,j)==0 )&&(visited(i,j)==0)
                noofregions=noofregions+1;
                top=1;
                stack(top,1)=i;
                stack(top,2)=j;
                 regions(noofregions,1)=i;
                
                regions(noofregions,2)=j;
                regions(noofregions,3)=i;
                regions(noofregions,4)=j;
                
                while top~=0
                    u=stack(top,1);
                    v=stack(top,2);
                    visited(u,v)=1;
                    top=top-1;
                  if  regions(noofregions,1)>u
                      regions(noofregions,1)=u;
                  end
                    if regions(noofregions,3)<u
                        regions(noofregions,3)=u;
                    end
                    if regions(noofregions,2)>v
                        regions(noofregions,2)=v;
                    end
                    if regions(noofregions,4)<v
                        regions(noofregions,4)=v;
                    end
                
                    if (u-1)>0 && visited(u-1,v)==0 && input(u-1,v)==0
                        top=top+1;
                        stack(top,1)=u-1;
                        stack(top,2)=v;
                    end
                    if (u+1)<=rows && visited(u+1,v)==0 && input(u+1,v)==0
                        top=top+1;
                        stack(top,1)=u+1;
                        stack(top,2)=v;
                    end
                    if (v-1)>0 && visited(u,v-1)==0 && input(u,v-1)==0
                        top=top+1;
                        stack(top,1)=u;
                        stack(top,2)=v-1;
                    end
                    if (v+1)<=columns && visited(u,v+1)==0 && input(u,v+1)==0
                        top=top+1;
                        stack(top,1)=u;
                        stack(top,2)=v+1;
                    end
                    
                    
                    
                end
            end
            
        end
    end

end