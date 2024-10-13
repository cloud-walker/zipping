import {createReadStream} from 'node:fs'
import {mkdir} from 'node:fs/promises'
import {pipeline} from 'node:stream'
import {promisify} from 'node:util'
import unzipper from 'unzipper'

const pipelineAsync = promisify(pipeline)

async function renameZipFiles() {
  const startTime = Date.now()

  try {
    await mkdir('unzipped_files', {recursive: true})

    await pipelineAsync(
      createReadStream('files.zip'),
      unzipper.Extract({path: 'unzipped_files'}),
    )
  } catch {}
}

void renameZipFiles()
