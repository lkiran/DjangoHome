from app.CommunicationServices.TwoWireInterface import TwoWireInterface


def int_to_bytes(value, length):
	result = []
	for i in range(0, length):
		result.append(value >> (i * 8) & 0xff)
	result.reverse()
	return result

def main():
	rList = [ 2, 0, 5, 255, 0x0, 0x00, 0x00, 0x00]
	print(rList)

	i2c = TwoWireInterface.Instance()
	i2c.Write(3, rList)


if __name__ == '__main__':
	main()