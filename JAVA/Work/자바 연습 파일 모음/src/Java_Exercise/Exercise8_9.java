package Java_Exercise;

class Exercise8_9
{
	public static void main(String[] args) throws Exception
	{
		throw new UnsupportedFuctionException("�������� �ʴ� ����Դϴ�.",100);
}
}


class UnsupportedFuctionException extends RuntimeException {
	final private int ERR_CODE = 100;
	
	public int getErrorCode(){
		return ERR_CODE;
	}
	
	public String getMessage(){
		return e.getMessage("�����");
	}
}