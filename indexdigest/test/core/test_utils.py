from unittest import TestCase

from indexdigest.utils import is_select_query, parse_dsn, shorten_query


class TestUtils(TestCase):

    def test_parse_dsn(self):
        parsed = parse_dsn('mysql://alex:pwd@localhost/test')

        self.assertEqual('localhost', parsed['host'])
        self.assertEqual('alex', parsed['user'])
        self.assertEqual('pwd', parsed['passwd'])
        self.assertEqual('test', parsed['db'])

    def test_is_select_query(self):
        self.assertTrue(is_select_query('SELECT * FROM foo'))
        self.assertTrue(is_select_query('select * from foo'))
        self.assertTrue(is_select_query('SELECT * FROM foo;'))
        self.assertTrue(is_select_query('  SELECT * FROM foo;'))

        self.assertFalse(is_select_query('BEGIN'))
        self.assertFalse(is_select_query('COMMIT'))
        self.assertFalse(is_select_query('/* SELECT */ COMMIT'))
        self.assertFalse(is_select_query('TRUNCATE foo;'))
        self.assertFalse(is_select_query('UPDATE foo SET bar=42 WHERE id=1'))

    def test_shorten_query(self):
        self.assertEquals('SELECT * FROM foo', shorten_query('SELECT * FROM foo'))
        self.assertEquals('SELECT * FROM foo', shorten_query('SELECT * FROM foo', max_len=18))
        self.assertEquals('SELECT * FROM foo', shorten_query('SELECT * FROM foo', max_len=17))
        self.assertEquals('SELECT * FROM fo...', shorten_query('SELECT * FROM foo', max_len=16))
