function x=haar_1(n,m,J,rnd)
%n - linii
%m - coloane
%J - imaginea integrala
%N,M noile dimensiuni ale mastii
N=round(n/20);
M=round(m/20);
% white=round(m_new/2);
% black=mnew-white;
parfor i=1:length(rnd)
    % [startingRow, startingColumn, endingRow, endingColumn]
    n_new=fix(N*rnd(i,3));
    m_new=fix(M*rnd(i,4));
    sR=fix(1+(n-2*n_new)*rnd(i,1));
    sC=fix(1+(m-2*m_new)*rnd(i,2));
    eR=sR+2*n_new;
    eC=sC+m_new;
    whiteSum = J(eR+1,eC+1) - J(eR+1,sC) - J(sR,eC+1) + J(sR,sC);
    sC=eC;
    eC=sC+m_new;
    blackSum = J(eR+1,eC+1) - J(eR+1,sC) - J(sR,eC+1) + J(sR,sC);
    x(i)=whiteSum-blackSum;
end