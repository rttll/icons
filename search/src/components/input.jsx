import { h, Fragment } from 'preact';
import { useState } from 'preact/hooks';

function Input() {
  const [results, setResults] = useState([]);

  const search = (e) => {
    fetch('/search?lib=1&query=' + e.target.value + '')
      .then((resp) => resp.json())
      .then((json) => {
        setResults(json.query.length);
      })
      .catch((err) => {
        // handle err
      });
  };

  return (
    <>
      <input
        type='text'
        placeholder='Search'
        className='block bg-gray-100 w-full p-4'
        onKeyUp={search}
      />
      <div>{results}</div>
    </>
  );
}

export default Input;
