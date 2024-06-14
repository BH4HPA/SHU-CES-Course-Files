function B= InverseMatrix (A)
[m,n] = size(A);
if m~=n
    disp('A is not a square matrix');
    return
end
if rank(A) < n
    disp('A is not a full rank matrix');
    return
end
C = [A ;eye(n)];
% Loop over the entire matrix.
i = 1;
j = 1;

while j <= n
   % Find value and index of largest element in the remainder of row i.
   [p,k] = max(abs(C(i,j:n))); k = k+j-1;  
   %%%%ע����벢û�п���A�ӽ������������p��С����ʱ�������ܴ�  
   %%%%��ֵ�����У����������Σ�����̫���ܳ���һ�����������㣬����С��ĳ����С����eps����Ϊ�ñ��������㡣
   %%%%eps��ѡȡ�������۵�������������й�ϵ������ͼ��������Χ0-255����eps��ȡ10^-3������Щ������ֵ��Χ��
   %%%%10^-3�ε�ʱ��eps���ܾ�Ҫȡ10^-9.����һ�����ܳ�0,
   %��ʱ�򲻷����ж�һ������A������Щ�����ܽӽ���0������Ҫ��̫�ϸ��ʱ���������1./(A+eps)����1./A
   % Swap i-th and k-th columns.
   C(i:end,[j, k]) = C(i:end,[k j]);
   % Divide the pivot column by the pivot element.
   C(i:end,j) = C(i:end,j)/C(i,j);
   % Subtract multiples of the pivot column from all the other columns.
   for k = [1:j-1 j+1:n]
      C(i:end,k) = C(i:end,k) - C(i,k)*C(i:end,j);
   end
   i = i + 1;
   j = j + 1;   
end
B = C(n+1:end,:);
end


