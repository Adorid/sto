import { NewStorj, UpdatedStorj } from '../generated/Gravity/Gravity'
import { Storj } from '../generated/schema'

export function handleNewStorj(event: NewStorj): void {
  let Storj = new Storj(event.params.id.toHex())
  Storj.owner = event.params.owner
  Storj.displayName = event.params.displayName
  Storj.imageUrl = event.params.imageUrl
  Storj.save()
}

export function handleUpdatedStorj(event: UpdatedStorj): void {
  let id = event.params.id.toHex()
  let Storj = Storj.load(id)
  if (Storj == null) {
    Storj = new Storj(id)
  }
  Storj.owner = event.params.owner
  Storj.displayName = event.params.displayName
  Storj.imageUrl = event.params.imageUrl
  Storj.save()
}
