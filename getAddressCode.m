function AddressCode = getAddressCode(AddressCodeBefore)
Head = AddressCodeBefore(1);
Head = strcat(Head,'×é');
Num = AddressCodeBefore(2:end);
Num = strcat(Num,'ºÅ');
AddressCode = strcat(Head,Num);
end