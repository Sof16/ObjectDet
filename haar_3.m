% function x=haar_3(n,m,J,rnd,n_new,m_new)
function x=haar_3(n,m,J,rnd)
N=round(n/20);
M=round (m/20);
% n_new=15;
% m_new=10;
% white=round(m_new/2);
% black=mnew-white;
for i=1:length(rnd)
    % [startingRow, startingColumn, endingRow, endingColumn]
    n_new=fix(N*rnd(i,3));
    m_new=fix(M*rnd(i,4));
    sR=fix(1+(n-2*n_new)*rnd(i,1));
    sC=fix(1+(m-2*m_new)*rnd(i,2));
    eR=sR+n_new;
    eC=sC+2*m_new;
    whiteSum = J(eR+1,eC) - J(eR+1,sC) - J(sR,eC) + J(sR,sC);
    sR=eR;
    eR=sR+n_new;
    blackSum = J(eR+1,eC) - J(eR+1,sC) - J(sR,eC) + J(sR,sC);
    x(i)=whiteSum-blackSum;
end