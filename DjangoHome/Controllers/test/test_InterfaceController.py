from rest_framework import status
from rest_framework.test import APITestCase


class TestInterfaceController(APITestCase):

	def test_get(self):
		response = self.client.get("/api/v1/interfaces", format='json')
		self.assertEqual(response.status_code, status.HTTP_200_OK)
	# self.assertEqual(len(response.data), 1)
